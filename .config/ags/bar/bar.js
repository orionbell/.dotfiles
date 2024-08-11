const hyprland = await Service.import("hyprland")

// Left side widgets

const Workspaces = () => {
    let active = hyprland.active.workspace.bind("id"),
    workspaces = Array.from({ length: 5 }, (_ , i) => i + 1).map(i => Widget.Button({
        class_names: active.as( active  => active === i ? ["active", "workspace"]: ["workspace"]),
        on_clicked: () => hyprland.messageAsync(`dispatch workspace ${i}`),
        attribute: i,
        label: active.as( active => active === i ? " " : " "),
    }))
    return Widget.EventBox({
        on_scroll_up: active.as( active => active >= 5 ? () => hyprland.messageAsync("dispatch workspace 0") : () => hyprland.messageAsync("dispatch workspace +1")),
        on_scroll_down: active.as( active => active <= 0 ? () => hyprland.messageAsync("dispatch workspace 5") : () => hyprland.messageAsync("dispatch workspace -1")),
        child: Widget.Box({
            children: workspaces,
        })
    })
}

// center Widgets


// Right Widgets

const Left = Widget.Box({
    class_name: "left_bar_cont",
    children:[
        Workspaces(),
    ],
})
const Center = Widget.Box({
    children:[
        Widget.Label("hello")
    ],
})
const Right = Widget.Box({
    children:[
        Widget.Label("test")
    ],
})

const BarCont = Widget.CenterBox({
    class_name:"bar_cont",
    start_widget:Left,
    center_widget:Center,
    end_widget: Right,
})

const Bar = (/** @type {number} */ monitor) => Widget.Window({
    class_name: "bar_window",
    monitor,
    name: `bar${monitor}`,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: BarCont,
})

export default Bar
