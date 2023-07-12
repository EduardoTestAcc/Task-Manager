const newIssueBtn = document.querySelector(".add-issue");
const issueModal = document.querySelector(".plan-issue");
const submitIssue = document.querySelector("#task-form");
const taskDetails = document.querySelector(".task-details");

newIssueBtn.addEventListener("click", () => {
    issueModal.showModal();
});

submitIssue.addEventListener("submit", async (event) => {
    const selectors = [".modal-team", ".modal-title", ".modal-summary", ".modal-priority"];
    const values = selectors.map(getTaskValues);
    let requestUrl = taskRequestTemplate(...values);

    await send_http_request("GET", requestUrl);

    resetTaskValues(selectors);
    const table = await send_http_request("GET", "getIssueList.jsp");
    document.querySelector("#task-table").innerHTML = table;
});

taskDetails.addEventListener("submit", async () => {
    const selectors = ["#task-id", ".details-priority", ".details-status"];
    const values = selectors.map(getUpdateTaskValues);
    let requestUrl = updateRequestTemplate(...values);

    const checkbox = taskDetails.querySelector("#delete-task");
    if (checkbox.checked) {
        const id = taskDetails.querySelector("#task-id").value;
        await send_http_request("GET", "removeTask.jsp?id="+id);
    }
    await send_http_request("GET", requestUrl);

    const table = await send_http_request("GET", "getIssueList.jsp");
    document.querySelector("#task-table").innerHTML = table;
});

let getTaskValues = (selector) => submitIssue.querySelector(selector).value;
let getUpdateTaskValues = (selector) => taskDetails.querySelector(selector).value;

function resetTaskValues(selectors) {
    const defaultValues = ["eng", "", "", "low"];
    setTaskValues(selectors, defaultValues);
}

function setTaskValues(selectors, values) {
    selectors.forEach((selector, index) => {
        submitIssue.querySelector(selector).value = values[index];
    });
}

updateRequestTemplate = (a, b, c) => `updateTask.jsp?id=${a}&priority=${b}&status=${c}`;

taskRequestTemplate = (a, b, c, d) => `setTask.jsp?team=${a}&title=${b}&summary=${c}&priority=${d}`;

function send_http_request(method, url) {
    const promise = new Promise((resolve) => {
        const xhr = new XMLHttpRequest();
        xhr.open(method, url);
        xhr.onload = () => {
            resolve(xhr.responseText);
        }
        xhr.send();
    })
    return promise;
};