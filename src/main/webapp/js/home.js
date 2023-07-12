const newIssueBtn = document.querySelector("[data-open-modal]");
const issueModal = document.querySelector("[data-modal]");
const submitIssue = document.querySelector("#task-form");

newIssueBtn.addEventListener("click", () => {
    issueModal.showModal();
});

console.log(submitIssue);

submitIssue.addEventListener("submit", async (event) => {
    const tittle = submitIssue.querySelector(".modal-input-title").value;
    await send_http_request("GET", "setTask.jsp?title=" + tittle + "&desc=" + tittle + "&prio=" + tittle);
    const table = await send_http_request("GET", "getIssueList.jsp")
    document.querySelector("#task-table").innerHTML = table;
});

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
}