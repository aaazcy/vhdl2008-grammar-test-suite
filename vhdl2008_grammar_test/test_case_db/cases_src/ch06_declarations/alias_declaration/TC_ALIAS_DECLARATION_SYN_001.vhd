-- =============================================================
-- Case ID: TC_ALIAS_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.6
-- Production: alias_declaration ::= alias alias_designator [ : subtype_indication ] is name [ signature ] ;
-- Case Type: Positive
-- Test Focus: Alias three forms: object alias(signal with subtype_indication) / subprogram alias(function with signature[integer return integer]) / enum literal alias(enumeration literal), verifying the optional subtype_indication and signature clauses of alias
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity alias_ent is port(a:in integer; y:out integer); end entity;
architecture bh of alias_ent is
  signal s_val:integer:=42;
  alias a_val:integer is s_val;
  function f_inc(x:integer) return integer is begin return x+1; end function;
  alias a_inc is f_inc[integer return integer];
  type t_color is (RED,GREEN,BLUE);
  alias RED_ALIAS is RED;
  signal s_c:t_color:=RED_ALIAS;
begin
  s_val<=f_inc(a); y<=a_inc(a_val);
end architecture bh;
