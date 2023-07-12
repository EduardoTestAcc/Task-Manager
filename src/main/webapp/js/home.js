const newIssueBtn = document.querySelector("[data-open-modal]");
const issueModal = document.querySelector("[data-modal]");
const submitIssue = document.querySelector("#task-form");

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

let getTaskValues = (selector) => submitIssue.querySelector(selector).value;

function resetTaskValues(selectors) {
    const defaultValues = ["eng", "", "", "low"];
    setTaskValues(selectors, defaultValues);
}

function setTaskValues(selectors, values) {
    selectors.forEach((selector, index) => {
        submitIssue.querySelector(selector).value = values[index];
    });
}
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