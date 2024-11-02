#!/bin/bash
#Autor: Juan David Alvarez Zapata
#Codigo: 2220221073
#Script interactivo

#=========================FUNCIONES========================
crearLibreta () {
	#$1: parametro nombre de la libreta
	touch "$1.txt" #Crea un archivo txt con el nombre pasado por parametro
	chmod 777 "$1.txt"
	echo "Se ha creado la libreta"
}

visualizarLibreta () {
	#$1: parametro nombre de la libreta
	cat "$1.txt" #Se muestra el interior del archivo txt
}

agregarApunte () {
	#$1: parametro texto que se quiere agregar 
	#$2: parametro nombre de la libreta 
	echo "$1" >> "$2.txt" #Se agrega el apunte pasado por parametro a la libreta que se desea por parametro
	echo "El texto ha sido agregado con exito"	
}

actualizarApunte () {
	#$1: parametro nombre de la libreta
	#$2: parametro numero de apunte a actualizar
	#$3: parametro nuevo apunte	
	apuntes=()

	#Se pasan las lineas de la libreta a un arreglo
	while IFS= read line
	do 
		apuntes+=("$line") 
	done < "$1.txt" #Archivo
	
	#Borra todo lo que hay en el archivo
	> "$1.txt"
	
	#Añade el nuevo apunte
	apuntes["$2"]="$3"
	
	#Escribe lo que hay en el arreglo al archivo
	for apunte in "${apuntes[@]}"
	do
		echo "$apunte" >> "$1.txt"
		echo 	
	done	

	echo "El apunte se ha actualizado correctamente"
}

eliminarApunte () {
	#$1: parametro nombre de la libreta
	#$2: parametro numero de apunte a eliminar
	apuntes=()

	#Se pasan las lineas de la libreta a un arreglo
	while IFS= read line
	do 
		apuntes+=("$line")
	done < "$1.txt" #Archivo
	
	#Borra todo lo que hay en el archivo
	> "$1.txt"
	
	#Borra en el arreglo lo que hay que eliminar
	unset apuntes["$2"]
	
	#Escribe lo que hay en el arreglo al archivo
	for apunte in ${apuntes[@]}
	do
		echo "$apunte" >> "$1.txt" 
	done	
	
	echo "El apunte $2 ha sido eliminado."	
}

eliminarLibreta () {
	#$1 parametro nombre de la libreta
	rm -f "$1.txt"
	echo "$1.txt se ha eliminado"
}

listarLibretas () {
	ls *.txt
}

comprimirLibretas () {
	#$2 parametro nombre de archivos a comprimir
	#$1 parametro nombre del archivo .zip

	zip "$1.zip" "$2.txt"
	echo "Se ha comprimido correctamente"
}

descomprimirLibreta () {
	#$1 parametro nombre del archivo .zip
	unzip -j "$1.zip" "*.txt"
	echo "Se ha descomprimido correctamente"
}

listarZip () {
	ls *.zip
}

eliminarZip () {
	#$1 parametro nombre del zip
	rm -f "$1.zip"
	echo "$1 se ha eliminado"
}

obtenerInfo () {
	#$1 parametro nombre del archivo
	stat "$1.txt"
}

conteoPalabras () {
	#$1 parametro nombre de la libreta
	wc -w "$1.txt"
}

conteoMemoria () {
	#$1 parametro nombre de la libreta
	du -h "$1.txt"
}

#==========================================APLICACIÓN======================================
clear
echo "___________________________________________________________"
echo "___________________________________________________________"
echo "___________________________________________________________"
echo "____¶_________________________________________________¶____"
echo "_____¶_______________________________________________¶_____"
echo "______¶_____________________________________________¶______"
echo "_______¶¶¶_______________________________________¶¶¶_______"
echo "_________¶¶¶¶_________________________________¶¶¶¶_________"
echo "_____¶_____¶_¶¶¶___________________________¶¶¶_¶_____¶_____"
echo "______¶¶________¶¶_______________________¶¶________¶¶______"
echo "______¶¶¶¶¶________¶¶_________________¶¶________¶¶¶¶¶______"
echo "_______¶¶¶¶¶¶¶¶______¶¶______________¶______¶¶¶¶¶¶¶¶_______"
echo "_________¶¶¶¶¶¶¶¶¶¶____¶___________¶____¶¶¶¶¶¶¶¶¶¶_________"
echo "_____________¶¶¶¶¶¶¶¶¶___¶_______¶___¶¶¶¶¶¶¶¶¶_____________"
echo "________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_¶_____¶_¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶________"
echo "____________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶_____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶____________"
echo "______________¶¶¶¶¶¶¶¶¶¶¶¶¶¶___¶¶¶¶¶¶¶¶¶¶¶¶¶¶______________"
echo "_____________¶___¶¶¶__¶¶¶_________¶¶¶__¶¶¶___¶_____________"
echo "_________________¶__¶______¶___¶______¶__¶_________________"
echo "___________________¶____¶¶¶_____¶¶¶____¶___________________"
echo "______________________¶¶¶¶_______¶¶¶¶______________________"
echo "____________________¶¶¶¶¶_________¶¶¶¶¶____________________"
echo "__________________¶¶¶¶¶¶___________¶¶¶¶¶¶__________________"
echo "_________________¶¶¶¶¶¶_____________¶¶¶¶¶¶_________________"
echo "________________¶¶¶¶¶¶¶_____________¶¶¶¶¶¶¶________________"
echo "________________¶¶¶¶¶_¶_____________¶_¶¶¶¶¶________________"
echo "_______________¶_¶¶¶¶__¶______________¶¶¶¶_¶_______________"
echo "_______________¶¶__¶¶_________________¶¶__¶¶_______________"
echo "____________________¶_________________¶____________________"
echo "______________¶_____________________________¶______________"
echo "______________¶_____________________________¶______________"
echo "___________________________________________________________"
sleep 1
clear

while true; do 
	echo "Bienvenido al gestor de libretas de apuntes"
	sleep 1
	echo "By Juan Alvarez"
	echo "NOTA: Este script debe ser ejecutado en modo administrador."
	echo ""
	sleep 1
	echo "===================MENÚ===================="
	echo "1. Crear libreta de apuntes."
	echo "2. Agregar apunte a una libreta."
	echo "3. Actualizar apunte en una libreta."
	echo "4. Eliminar apunte en una libreta."
	echo "5. Visualizar una libreta."
	echo "6. Eliminar una libreta."
	echo "7. Listar libretas."
	echo "8. Comprimir libreta."
	echo "9. Descomprimir libreta."
	echo "10. Listar libretas comprimidas."
	echo "11. Eliminar libretas comprimidas."
	echo "12. Información de fechas de una libreta."
	echo "13. Conteo de palabras por libreta."
	echo "14. Peso en memoria por libreta."
	echo "15. Directorio de apuntes"
	echo "0. Salir"
	sleep 1
		
	read -p "Ingrese la opcion deseada: " opcion
	
	case $opcion in 
		1) clear
			read -p "Ingrese el nombre de la libreta a crear (Sin extensión del archivo): " nombreLibreta
			crearLibreta "$nombreLibreta"
			echo "";;
		2) clear
			read -p "Ingrese el apunte: " apunte
			echo "Libretas disponibles: "
			ls *.txt
			read -p "Ingrese el nombre de la libreta a agregar el apunte (Sin extensión del archivo): " nombreLibreta
			agregarApunte "$apunte" "$nombreLibreta"
			echo "";;
		3) clear	
			echo "Libretas disponibles: "
			ls *.txt
			read -p "Ingrese el nombre de la libreta a actualizar (Sin extensión del archivo): " nombreLibreta
			echo ""
			echo "Apuntes de la libreta"
			cat "$nombreLibreta.txt"
			read -p "Ingrese el número de apunte a actualizar (Empiezan desde 0): " numeroActualizar
		      	read -p "Ingrese el nuevo apunte: " nuevoApunte
			actualizarApunte "$nombreLibreta" "$numeroActualizar" "$nuevoApunte"
			echo "";;
		4) clear 
			echo "Libretas disponibles: "
			ls *.txt
			read -p "Ingrese el nombre de la libreta (Sin extensión del archivo): " nombreLibreta	
			echo ""
			echo "Apuntes de la libreta: "
			cat "$nombreLibreta.txt"
			read -p "Ingrese el número del apunte a eliminar (Empiezan desde 0): " numeroEliminar
			eliminarApunte "$nombreLibreta" "$numeroEliminar"
			echo "";;
		5) clear
			echo "Libretas disponibles: "
			ls *.txt
			read -p "Ingrese el nombre de la libreta a visualizar (Sin extensión del archivo): " nombreLibreta
			visualizarLibreta "$nombreLibreta"
			echo "";;
		6) clear
			echo "Libretas disponibles: "
			ls *.txt
			read -p "Ingrese el nombre de la libreta a eliminar (Sin extensión del archivo): " nombreLibreta
			eliminarLibreta $nombreLibreta
			echo "";;
		7) clear
			echo "Lista de libretas: "
			listarLibretas
			echo "";;
		8) clear 
			echo "Libretas disponibles: "
			ls *.txt 
			read -p "Ingrese el nombre del archivo comprimido (Sin extensión del archivo): " nombreComprimido
			read -p "Ingrese el nombre de la libreta a comprimir (Sin extensión del archivo): " nombreLibreta
			comprimirLibretas "$nombreComprimido" "$nombreLibreta"
			echo "";;
		9) clear 
			echo "Archivos de libretas comprimidas disponibles: "
			ls *.zip
			echo "NOTA: Si desea reemplazar el nombre del descomprimido, tiene que añadir la extensión del archivo. (.txt)"
			read -p "Ingrese el nombre del archivo a descomprimir (Sin extensión del archivo): " nombreComprimido
			descomprimirLibreta "$nombreComprimido"
			echo "";;
		10) clear
			echo "lista de archivos zip: "
			listarZip
			echo "";;	
		11) clear
			echo "Archivos zip disponibles"
			ls *.zip
			read -p "Ingresar el nombre del archivo a eliminar (Sin extensión del archivo): " nombreArchivo
			eliminarZip "$nombreArchivo"
			echo "";;
		12) clear	
			echo "Libretas disponibles: "
			ls *.txt
			read -p "Ingrese el nombre de la libreta (Sin extensión del archivo): " nombreLibreta
			obtenerInfo "$nombreLibreta"
			echo "";;
		13) clear	
			echo "Libretas disponibles: "
			ls *.txt
			read -p "Ingrese el nombre de la libreta (Sin extensión del archivo): " nombreLibreta
			conteoPalabras "$nombreLibreta"
			echo "";;
		14) clear 	
			echo "Libretas disponibles: "
			ls *.txt
			read -p "Ingrese el nombre de la libreta (Sin extensión del archivo): " nombreLibreta
			conteoMemoria "$nombreLibreta"
			echo "";;
		15) clear
			echo "El directorio donde se encuentran los apuntes es: "
			pwd
			echo "";;
		0) clear
			echo "Gracias por utilizar el servicio."
			break;;
		*) clear
			echo "$opcion es una opción incorrecta";;
		esac
done 
