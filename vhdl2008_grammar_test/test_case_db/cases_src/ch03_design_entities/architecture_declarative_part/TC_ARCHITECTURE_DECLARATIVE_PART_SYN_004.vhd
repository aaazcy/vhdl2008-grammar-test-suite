-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Subprogram declarations + bodies + aliases + attributes: declarative part contains function declaration+body (with variables and return)/procedure declaration+body (with in+out parameters)/impure function/object alias (with subtype_indication)/subprogram alias (with signature)/attribute declaration+specification, verifying the subprogram/alias/attribute declarative item categories
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adp_subp_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of adp_subp_ent is
  function f_add(x,y:integer) return integer is
  begin return x+y; end function;
  function f_mul(x,y:integer) return integer;
  function f_mul(x,y:integer) return integer is
  begin return x*y; end function;
  impure function f_cnt return integer is
    variable v:integer:=0; begin v:=v+1; return v; end function;
  procedure p_swap(signal x:inout integer; signal y:inout integer) is
    variable t:integer; begin t:=x; x<=y; y<=t; end procedure;
  signal s_a,s_b:integer:=0;
  alias a_val:integer is s_a;
  alias a_add is f_add[integer,integer return integer];
  attribute style:string;
  attribute style of f_mul[integer,integer return integer]:function is "combinational";
begin
  s_a<=a; s_b<=b; p_swap(s_a,s_b);
  y<=a_add(a_val,s_b)+f_cnt;
end architecture bh;
