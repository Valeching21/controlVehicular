Imports System.Data.SqlClient

Public Class dbPersona
    Public ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("II-46connectionString").ConnectionString

    Public Function create(Persona As Persona) As String
        Try
            Dim sql As String = "INSERT INTO Personas (Nombre, Apellido1, Apellido2, Edad) VALUES(@Nombre, @Apellido1, @Apellido2, @Edad)"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@Nombre", Persona.Nombre),
                New SqlParameter("@Apellido1", Persona.Apellido1),
                New SqlParameter("@Apellido12", Persona.Apellido2),
                New SqlParameter("@Edad", Persona.FechaNacimiento)
            }

            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(sql, connection)
                    command.Parameters.AddRange(parametros.ToArray())
                    connection.Open()
                    command.ExecuteNonQuery()
                End Using

            End Using
        Catch ex As Exception

        End Try
        Return "Persona Creada"
    End Function

    Public Function delete(id As Integer) As String
        Try
            Dim sql As String = "DELETE FROM Personas WHERE ID = @Id"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@Id", id)
            }
            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(sql, connection)
                    command.Parameters.AddRange(parametros.ToArray())
                    connection.Open()
                    command.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
        End Try
        Return "Persona Eliminada"
    End Function

    Public Function update(Persona As Persona) As String
        Try
            Dim sql As String = "UPDATE Personas SET Nombre = @Nombre, Apellido = @Apellido, Edad = @Edad WHERE ID = @Id"
            Dim parametros As New List(Of SqlParameter) From {
                New SqlParameter("@Nombre", Persona.Nombre),
                New SqlParameter("@Apellido", Persona.Apellido),
                New SqlParameter("@Edad", Persona.Edad),
                New SqlParameter("@Id", Persona.ID)
            }
            Using connection As New SqlConnection(connectionString)
                Using command As New SqlCommand(sql, connection)
                    command.Parameters.AddRange(parametros.ToArray())
                    connection.Open()
                    command.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
        End Try
        Return "Persona Actualizada"


    End Function
End Class
