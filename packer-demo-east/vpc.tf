# Internet VPC
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "main"
    }
}


# Subnets
resource "aws_subnet" "us-east-1b-public" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"

    tags {
        Name = "us-east-1b-public"
    }
}
resource "aws_subnet" "us-east-1d-public" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1d"

    tags {
        Name = "us-east-1d-public"
    }
}
resource "aws_subnet" "us-east-1c-public" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1c"

    tags {
        Name = "us-east-1c-public"
    }
}
resource "aws_subnet" "us-east-1d-private" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1d"

    tags {
        Name = "us-east-1d-private"
    }
}
resource "aws_subnet" "us-east-1b-private" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"

    tags {
        Name = "us-east-1b-private"
    }
}
resource "aws_subnet" "us-east-1c-private" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1c"

    tags {
        Name = "us-east-1c-private"
    }
}

# Internet GW
resource "aws_internet_gateway" "us-east-1-gw" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "main"
    }
}

# route tables
resource "aws_route_table" "us-east-1-public" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.us-east-1-gw.id}"
    }

    tags {
        Name = "us-east-1-public"
    }
}

# route associations public
resource "aws_route_table_association" "us-east-1d-public" {
    subnet_id = "${aws_subnet.us-east-1d-public.id}"
    route_table_id = "${aws_route_table.us-east-1-public.id}"
}
resource "aws_route_table_association" "us-east-1b-public" {
    subnet_id = "${aws_subnet.us-east-1b-public.id}"
    route_table_id = "${aws_route_table.us-east-1-public.id}"
}
resource "aws_route_table_association" "us-east-1c-public" {
    subnet_id = "${aws_subnet.us-east-1c-public.id}"
    route_table_id = "${aws_route_table.us-east-1-public.id}"
}
