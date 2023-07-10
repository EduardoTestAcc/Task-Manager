const newIssueBtn = document.querySelector("[data-open-modal]");
const issueModal = document.querySelector("[data-modal]");

newIssueBtn.addEventListener("click", () => {
    issueModal.showModal();
});

