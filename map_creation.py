package com.example.movee1

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.example.movee1.databinding.ActivityMapsBinding
import com.google.android.gms.maps.model.LatLngBounds

class MapsActivity : AppCompatActivity(), OnMapReadyCallback {

    private lateinit var mMap: GoogleMap
    private lateinit var binding: ActivityMapsBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMapsBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        val mapFragment = supportFragmentManager
            .findFragmentById(R.id.map) as SupportMapFragment
        mapFragment.getMapAsync(this)
    }

    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap

        val hotel  = LatLng(55.778076776194844, 37.67083048536124)
        mMap.addMarker(MarkerOptions().position(hotel).title("Hotel Adam").snippet("Тут был снят очень известный фильм"));

        //mMap.moveCamera(CameraUpdateFactory.newLatLng(hotel))
        val moscowBounds = LatLngBounds(
            LatLng((55.573081), 37.333316),  // SW bounds
            LatLng((55.903789), 37.838305) // NE bounds
        )
        mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(moscowBounds.center, 10f))
        val adelaideBounds = LatLngBounds(
            LatLng(53.0, 35.0),  // SW bounds
            LatLng(58.0, 41.0) // NE bounds
        )

        mMap.setLatLngBoundsForCameraTarget(adelaideBounds)

    }
}
