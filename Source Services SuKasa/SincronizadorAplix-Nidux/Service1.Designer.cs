﻿namespace SincronizadorAplix_Nidux
{
    partial class Service1
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.timerEjecucion = new System.Timers.Timer();
            ((System.ComponentModel.ISupportInitialize)(this.timerEjecucion)).BeginInit();
            // 
            // timerEjecucion
            // 
            this.timerEjecucion.Enabled = true;
            this.timerEjecucion.Elapsed += new System.Timers.ElapsedEventHandler(this.timerEjecucion_Elapsed);
            // 
            // Service1
            // 
            this.ServiceName = "Service1";
            ((System.ComponentModel.ISupportInitialize)(this.timerEjecucion)).EndInit();

        }

        #endregion

        private System.Timers.Timer timerEjecucion;
    }
}
