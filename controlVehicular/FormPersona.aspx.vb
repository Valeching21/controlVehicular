Public Class FormPersona
    Inherits System.Web.UI.Page
    Public Persona As New Persona()
    Protected dbHelper As New dbPersona()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btn_regresar.Visible = False
        btn_guardar.Visible = True
        btn_actualizar.Visible = False
    End Sub

    Protected Sub btn_guardar_Click(sender As Object, e As EventArgs)
        Persona.Nombre = txt_nombre.Text
        Persona.Apellido1 = txt_apellido1.Text
        Persona.Apellido2 = txt_apellido2.Text
        Persona.FechaNacimiento = txt_fecha.Text
        Persona.Nacionalidad = txt_Nacionalidad.Text
        Persona.Telefono = txt_Telefono.Text

        lbl_mensaje.Text = dbHelper.create(Persona)
        GridView1.DataBind()
        txt_nombre.Text = ""
        txt_apellido1.Text = ""
        txt_apellido2.Text = ""
        txt_fecha.Text = ""
        txt_Nacionalidad.Text = ""
        txt_Telefono.Text = ""

        btn_regresar.Visible = False
        btn_guardar.Visible = True
        btn_actualizar.Visible = False


    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
            dbHelper.delete(Id)
            e.Cancel = True
            GridView1.DataBind()
            lbl_mensaje.Text = "Persona eliminada correctamente."
        Catch ex As Exception
            lbl_mensaje.Text = "Error al eliminar la persona: " & ex.Message
        End Try
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)

    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)

        GridView1.EditIndex = -1
        GridView1.DataBind()

    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)

        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
        Dim persona As Persona = New Persona With {
            .Nombre = e.NewValues("Nombre"),
            .Apellido1 = e.NewValues("Apellido"),
            .Apellido2 = e.NewValues("Apellido2"),
            .FechaNacimiento = e.NewValues("Fecha"),
            .Nacionalidad = e.NewValues("Nacionalidad"),
            .Telefono = e.NewValues("Telefono"),
            .IdPersona = Id
        }
        dbHelper.update(persona)
        e.Cancel = True
        lbl_mensaje.Text = "Se actualizó la Información"
        GridView1.DataBind()
        GridView1.EditIndex = -1

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim Id As Integer = Convert.ToInt32(GridView1.DataKeys(GridView1.SelectedIndex).Value)
        Dim row As GridViewRow = GridView1.SelectedRow

        txt_nombre.Text = row.Cells(2).Text
        txt_apellido1.Text = row.Cells(3).Text
        txt_apellido2.Text = row.Cells(4).Text
        txt_fecha.Text = row.Cells(6).Text ' OJO: Fecha está más adelante
        txt_Nacionalidad.Text = row.Cells(5).Text
        txt_Telefono.Text = row.Cells(7).Text

        editando.Value = Id

        btn_guardar.Visible = False
        btn_actualizar.Visible = True
        btn_regresar.Visible = True
    End Sub

    Protected Sub btn_actualizar_Click(sender As Object, e As EventArgs)


        Dim persona As Persona = New Persona With {
            .Nombre = txt_nombre.Text,
            .Apellido1 = txt_apellido1.Text,
            .Apellido2 = txt_apellido2.Text,
            .FechaNacimiento = txt_fecha.Text,
            .Nacionalidad = txt_Nacionalidad.Text,
            .Telefono = txt_Telefono.Text,
            .IdPersona = editando.Value
        }
        dbHelper.update(persona)
        lbl_mensaje.Text = "Se actualizó la Información"
        txt_nombre.Text = ""
        txt_apellido1.Text = ""
        txt_apellido2.Text = ""
        txt_fecha.Text = ""
        txt_Nacionalidad.Text = ""
        txt_Telefono.Text = ""
        GridView1.DataBind()
        GridView1.EditIndex = -1

    End Sub

    Protected Sub btn_regresar_Click(sender As Object, e As EventArgs)

        txt_nombre.Text = ""
        txt_apellido1.Text = ""
        txt_apellido2.Text = ""
        txt_fecha.Text = ""
        txt_Nacionalidad.Text = ""
        txt_Telefono.Text = ""


        btn_guardar.Visible = True
        btn_actualizar.Visible = False
        btn_regresar.Visible = False
        lbl_mensaje.Text = "Edición Terminada."

    End Sub
End Class