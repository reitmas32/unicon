class ScrollBarButton extends HTMLElement {
    constructor() {

        super();

        // Read the message from the data attribute.
        const id = this.dataset.id;

        const button = this.querySelector("button");
        const label = this.querySelector("p");

        var labels = document.getElementsByClassName("label-scrollbar-button");

        if (button) {
            button.addEventListener("click", () => {
                var elements = document.getElementsByClassName("scroll-nav-item") as HTMLCollectionOf<HTMLElement>;
                var labels = document.getElementsByClassName("label-scrollbar-button") as HTMLCollectionOf<HTMLElement>;


                for (var i = 0; i < elements.length; i++) {
                    elements[i].style.backgroundColor = "#5c5c5c";
                }
                for (var i = 0; i < labels.length; i++) {
                    labels[i].style.display = "none";
                }

                if (label) {

                    label.style.display = "block";
                }

                button.style.backgroundColor = "white"
            });
        }
    }
}

customElements.define("scrollbar-button", ScrollBarButton);