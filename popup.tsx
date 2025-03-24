import { useState } from "react"
import rickDancing from "data-base64:~assets/rick-dancing.gif"
import "styles.css"

function IndexPopup() {

  return (
    <div
      style={{
        backgroundColor: "#121212",
        color: "#ffffff",
        fontFamily: "'Comic Sans MS', 'Comic Sans', cursive",
        boxShadow: "0 4px 8px rgba(0, 0, 0, 0.5)",
        width: "300px",
        height: "auto",
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        gap: 12
      }}>
      <h2 style={{ 
        color: "#ff5252", 
        textAlign: "center",
        marginBottom: 10
      }}>
        Never Gonna Give You Up!
      </h2>
      
      <img 
        src={rickDancing}
        alt="Rick Astley Dancing"
        style={{
          width: "200px",
          height: "auto",
          borderRadius: 4,
          marginBottom: 12
        }}
      />
     <b>Never gonna let you down...</b>
      
      <a 
        href="https://www.youtube.com/watch?v=dQw4w9WgXcQ" 
        target="_blank"
        style={{
          backgroundColor: "#ff5252",
          color: "#ffffff",
          padding: "8px 16px",
          borderRadius: 4,
          textDecoration: "none",
          fontWeight: "bold",
          marginBottom: 12,
          textAlign: "center"
        }}>
        Say NO to LinkedIn!<br />
        Say Yes to Rick!
      </a>
      
      <p style={{ 
        fontSize: "12px", 
        color: "#888888",
        textAlign: "center" 
      }}>
        We're no strangers to code...
      </p>
    </div>
  )
}

export default IndexPopup