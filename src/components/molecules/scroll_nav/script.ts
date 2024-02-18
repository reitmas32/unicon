class ScrollBarButton extends HTMLElement {
    constructor() {

        super();

        // Read the message from the data attribute.
        const id = this.dataset.id;

        const button = this.querySelector("button");
        const label = this.querySelector("p");

        var labels = document.getElementsByClassName("label-scrollbar-button");

        var elements = document.getElementsByClassName("scroll-nav-item") as HTMLCollectionOf<HTMLElement>;
        elements[0].style.backgroundColor = "white";
        elements[0].style.transform = "scale(1.0)"

        button?.addEventListener("mouseover", () => {

            if (label) {
                label.style.display = "block";
                button.style.transform = "scale(1.2)"
            }
        });

        button?.addEventListener("mouseout", () => {

            if (label) {
                label.style.display = "none";
                if (button.style.backgroundColor == "white") {
                    button.style.transform = "scale(1.1)"

                } else {

                    button.style.transform = "scale(0.7)"
                }
            }
        });

        if (button) {
            button.addEventListener("click", () => {
                var elements = document.getElementsByClassName("scroll-nav-item") as HTMLCollectionOf<HTMLElement>;


                for (var i = 0; i < elements.length; i++) {
                    elements[i].style.backgroundColor = "#5c5c5c";
                    elements[i].style.transform = "scale(0.7)"
                }




                button.style.backgroundColor = "white"
                button.style.transform = "scale(1.2)"
            });
        }
    }
}

customElements.define("scrollbar-button", ScrollBarButton);