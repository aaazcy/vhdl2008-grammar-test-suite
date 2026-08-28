-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_022
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: All alias categories: declarative part contains an object alias (signal alias with subtype_indication), a subprogram alias (function alias with signature), and an enumeration literal alias, the statement part drives the same signal through the original name and the alias, verifying all three forms of alias_declaration are legal in architecture_declarative_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_alias_ent is
  port(a,b:in bit; sum,product:out integer);
end entity;
architecture rtl of arch_alias_ent is
  signal s_val:integer:=42;
  alias a_val:integer is s_val;
  function f_adder(x:integer) return integer is
  begin return x+1; end function;
  alias a_adder is f_adder[integer return integer];
  type t_color is (RED,GREEN,BLUE);
  alias RED_ALIAS is RED;
  signal s_color:t_color:=RED_ALIAS;
  signal s_sum:integer:=0;
begin
  process(a_val)
  begin
    s_val<=a_adder(a_val);
    s_sum<=a_val+1;
  end process;
  sum<=s_sum;
  product<=s_val;
end architecture rtl;
