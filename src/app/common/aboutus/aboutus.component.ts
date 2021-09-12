import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-aboutus',
  templateUrl: './aboutus.component.html',
  styleUrls: ['./aboutus.component.css']
})
export class AboutusComponent implements OnInit {
 images:string[] = ["organic1.jpg","organic2.jpg","organic3.jpg","organic4.jpg","organic5.jpg"];
 current:string ="https://cloudstorage1806.blob.core.windows.net/projectimages/organic1.jpg";
  constructor() { }

  ngOnInit(): void {
    setInterval(()=> this.current ="https://cloudstorage1806.blob.core.windows.net/projectimages/" +this.images[Math.round(Math.random()*4)]
    ,2000)
  }

}
