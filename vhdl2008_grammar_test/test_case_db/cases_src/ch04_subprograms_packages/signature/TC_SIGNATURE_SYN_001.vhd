-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.3.3
-- Production: signature ::= [ [ type_mark { , type_mark } ] return type_mark ]
-- Case Type: Positive
-- Test Focus: Signature full forms: param+return([integer,bit return boolean])/return-only([return integer])/empty([]), used in attribute specification to distinguish overloaded subprograms
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sig_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sig_ent is
  function f_add(x,y:integer) return integer is begin return x+y; end function;
  function f_add(x:integer) return integer is begin return x+1; end function;
  attribute note:string;
  attribute note of f_add[integer,integer return integer]:function is "two-arg";
  attribute note of f_add[integer return integer]:function is "one-arg";
begin y<=f_add(a,a)+f_add(a); end architecture bh;
