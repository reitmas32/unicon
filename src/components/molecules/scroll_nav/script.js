class ScrollBarButton extends HTMLElement {
    constructor() {

        super();

        // Read the message from the data attribute.
        const id = this.dataset.id;
        const button = this.querySelector("button");
        console.log("hola")
        if (button) {
            button.addEventListener("click", () => {
                document.getElementById("scroll-nav-item-1").style.backgroundColor = "#5c5c5c"
                document.getElementById("scroll-nav-item-2").style.backgroundColor = "#5c5c5c"


                button.style.backgroundColor = "white"
                // TODO aqui debo multiplicar id por heigh y hacer scroll
            });
        }
    }
}

customElements.define("scrollbar-button", ScrollBarButton);