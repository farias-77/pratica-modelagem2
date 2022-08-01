CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" int NOT NULL,
	"mainPictureId" int NOT NULL UNIQUE,
	"categoryId" int NOT NULL,
	"size" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pictures" (
	"id" serial NOT NULL,
	"pictureURL" TEXT NOT NULL,
	"productId" int NOT NULL,
	CONSTRAINT "pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.saleDetails" (
	"id" serial NOT NULL,
	"saleId" int NOT NULL,
	"productId" int NOT NULL,
	"howMany" int NOT NULL,
	CONSTRAINT "saleDetails_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sales" (
	"id" serial NOT NULL,
	"status" TEXT NOT NULL,
	"date" DATE NOT NULL,
	"addressId" int NOT NULL,
	"customerId" int NOT NULL,
	CONSTRAINT "sales_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.addresses" (
	"id" serial NOT NULL,
	"address" TEXT NOT NULL,
	"customerId" int NOT NULL,
	CONSTRAINT "addresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("mainPictureId") REFERENCES "pictures"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");

ALTER TABLE "pictures" ADD CONSTRAINT "pictures_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");


ALTER TABLE "saleDetails" ADD CONSTRAINT "saleDetails_fk0" FOREIGN KEY ("saleId") REFERENCES "sales"("id");
ALTER TABLE "saleDetails" ADD CONSTRAINT "saleDetails_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("addressId") REFERENCES "addresses"("id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk1" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "addresses" ADD CONSTRAINT "addresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");








