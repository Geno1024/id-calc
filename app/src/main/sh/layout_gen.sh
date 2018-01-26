#!/usr/bin/env bash
exec > ../res/layout/activity_main.xml
properties=$(cat <<- EOF
android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:layout_marginStart="0dp"
        android:layout_marginTop="0dp"
        android:ems="1"
        android:singleLine="true"
        android:text=""
EOF
)

cat << EOF
<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context="com.geno.idnumcalc.MainActivity">

    <EditText
        android:id="@+id/input1"
        ${properties}
        app:layout_constraintEnd_toStartOf="@+id/input2"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

EOF

for i in {2..17}
do
    cat << EOF
    <EditText
        android:id="@+id/input${i}"
        ${properties}
        app:layout_constraintEnd_toStartOf="@+id/input$((i + 1))"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintStart_toEndOf="@+id/input$((i - 1))"
        app:layout_constraintTop_toTopOf="parent" />

EOF
done

cat << EOF
    <EditText
        android:id="@+id/input18"
        ${properties}
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintStart_toEndOf="@+id/input17"
        app:layout_constraintTop_toTopOf="parent" />

EOF

echo "</android.support.constraint.ConstraintLayout>"