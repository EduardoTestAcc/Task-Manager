const newIssueBtn = document.querySelector("[data-open-modal]");
const issueModal = document.querySelector("[data-modal]");
const submitIssue = issueModal.querySelector(".modal-submit");

newIssueBtn.addEventListener("click", () => {
    issueModal.showModal();
});

submitIssue.addEventListener("click", () => {

});
