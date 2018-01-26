package com.geno.idnumcalc

import android.app.Activity
import android.graphics.Typeface
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.util.Log
import android.widget.EditText
import android.widget.LinearLayout
import kotlinx.android.synthetic.main.activity_main2.*

class MainActivity : Activity()
{
    private val TAG = "MainActivity"

    override fun onCreate(savedInstanceState: Bundle?)
    {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main2)
        input.apply {
//            setText("??????????????????")
            addTextChangedListener(object : TextWatcher
            {
                override fun afterTextChanged(s: Editable?)
                {
                    Log.d(TAG, "afterTextChanged / s: ${s.toString()}")
                }

                override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int)
                {
                    Log.d(TAG, "beforeTextChanged / s: ${s.toString()}, start: $start, count: $count, after: $after")
                }

                override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int)
                {
                    Log.d(TAG, "onTextChanged / s: ${s.toString()}, start: $start, before: $before, count: $count")
                }
            })
        }
    }

    private fun LinearLayout.addResult(string: String)
    {
        addView(EditText(this@MainActivity).apply {
            setText(string)
            typeface = Typeface.MONOSPACE
            setPadding(paddingLeft, 0, paddingRight, 0)
            background = null
        }, LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)
    }
}
