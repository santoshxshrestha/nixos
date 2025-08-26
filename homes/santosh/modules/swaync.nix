{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-2fa-action = true;
      notification-inline-replies = true;
      notification-icon-size = 72;
      notification-body-image-height = 120;
      notification-body-image-width = 240;
    };
    style = ''
      * {
        font-family: "JetBrains Mono Nerd Font", "Fira Code Nerd Font", monospace;
        font-size: 11px;
      }

      .control-center {
        background: rgba(0, 0, 0, 0.8);
        border-radius: 8px;
        border: 1px solid rgba(82, 79, 103, 0.3);
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.4);
        color: #b8b5c7;
      }

      .control-center-list {
        background: transparent;
        border-radius: 6px;
        border: none;
        margin: 4px;
      }

      .control-center-list-placeholder {
        opacity: 0.4;
        font-style: italic;
        font-weight: 300;
        color: #b8b5c7;
      }

      .blank-window {
        background: rgba(0, 0, 0, 0.3);
      }

      .floating-notifications .notification-row {
        padding: 6px;
        margin: 4px;
      }

      .notification-row {
        outline: none;
        margin: 4px 0;
        padding: 8px 10px;
        border-radius: 6px;
        color: #b8b5c7;
        background: rgba(82, 79, 103, 0.8);
        border: 1px solid rgba(82, 79, 103, 0.2);
        transition: all 0.3s ease;
        position: relative;
      }

      .notification-row:focus,
      .notification-row:hover {
        background: rgba(82, 79, 103, 0.2);
        color: #d4d1e0;
        transform: none;
        box-shadow: none;
      }

      .notification-group {
        background: rgba(82, 79, 103, 0.1);
        border-radius: 6px;
        border: 1px solid rgba(82, 79, 103, 0.2);
        margin: 4px;
        overflow: hidden;
      }

      .notification-group-headers {
        font-weight: bold;
        font-size: 12px;
        color: #ffffff;
        letter-spacing: 0.5px;
        margin-left: 0;
        background: transparent;
        padding: 8px 10px;
      }

      .notification-group-icon {
        color: #b8b5c7;
        margin-right: 8px;
      }

      .notification-group-collapse-button,
      .notification-group-close-all-button {
        background: rgba(82, 79, 103, 0.2);
        border: 1px solid rgba(82, 79, 103, 0.3);
        color: #b8b5c7;
        border-radius: 4px;
        padding: 4px 8px;
        transition: all 0.3s ease;
        font-weight: normal;
        font-size: 11px;
      }

      .notification-group-collapse-button:hover,
      .notification-group-close-all-button:hover {
        background: rgba(82, 79, 103, 0.3);
        color: #ffffff;
        transform: none;
        box-shadow: none;
      }

      .notification {
        padding: 10px;
        background: rgba(82, 79, 103, 0.1);
        border-radius: 6px;
        color: #b8b5c7;
        border: none;
        position: relative;
        overflow: hidden;
        box-shadow: none;
      }

      .notification::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 2px;
        height: 100%;
      }

      .low {
        border-left: 2px solid rgba(0, 255, 0, 0.4);
        background: rgba(82, 79, 103, 0.1);
      }

      .normal {
        border-left: 2px solid rgba(82, 79, 103, 0.4);
        background: rgba(82, 79, 103, 0.1);
      }

      .notification.critical {
        background: rgba(255, 0, 0, 0.15);
        border: 1px solid rgba(255, 0, 0, 0.3);
        color: #ff6666;
      }

      .notification.critical::before {
        background: #ff6666;
      }

      @keyframes blink {
        to {
          background: rgba(255, 0, 0, 0.25);
        }
      }

      .notification.critical {
        animation: blink 0.5s linear infinite alternate;
      }

      .notification-content {
        padding: 4px 0;
        margin-left: 8px;
        color: #b8b5c7;
        background: transparent;
        line-height: 1.4;
      }

      .close-button {
        background: rgba(255, 0, 0, 0.2);
        color: #ff6666;
        border-radius: 20px;
        width: 20px;
        height: 20px;
        font-size: 12px;
        font-weight: normal;
        transition: all 0.3s ease;
      }

      .close-button:hover {
        background: rgba(255, 0, 0, 0.3);
        color: #ffffff;
        transform: none;
        box-shadow: none;
      }

      .notification-default-action,
      .notification-action {
        padding: 4px 8px;
        margin: 2px 4px 2px 0;
        border-radius: 4px;
        background: rgba(82, 79, 103, 0.2);
        color: #b8b5c7;
        font-weight: normal;
        transition: all 0.3s ease;
        font-size: 11px;
      }

      .notification-default-action:hover,
      .notification-action:hover {
        background: rgba(82, 79, 103, 0.3);
        color: #ffffff;
        transform: none;
        box-shadow: none;
      }

      .image {
        margin-left: 0;
        margin-right: 8px;
        min-width: 48px;
        min-height: 48px;
        border-radius: 4px;
        background: rgba(82, 79, 103, 0.1);
        box-shadow: none;
      }

      .body-image {
        background: rgba(82, 79, 103, 0.05);
        border-radius: 4px;
        box-shadow: none;
      }

      .summary {
        font-size: 12px;
        font-weight: bold;
        color: #ffffff;
        text-shadow: none;
        margin-bottom: 2px;
        background: transparent;
      }

      .time {
        font-size: 10px;
        font-weight: normal;
        color: #b8b5c7;
        margin-bottom: 4px;
        font-style: italic;
        opacity: 0.7;
      }

      .body {
        font-size: 11px;
        font-weight: normal;
        background: transparent;
        color: #b8b5c7;
        line-height: 1.3;
        margin-top: 4px;
      }

      /* Tooltip styling to match waybar */
      tooltip {
        background: rgba(0, 0, 0, 0.8);
        border-radius: 6px;
        border: 1px solid rgba(82, 79, 103, 0.5);
        color: #b8b5c7;
      }

      tooltip label {
        color: #b8b5c7;
      }
    '';
  };
}
