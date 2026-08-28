-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Declarative part — subprograms/attributes/components/disconnect/use: entity_declarative_part declares function(including impure function)/procedure/component declaration/disconnect specification/attribute declaration+specification/use clause(with .all import), verifying all non-object declaration item categories in the entity-level declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_decl_misc is
  port(a, b : in integer; op : in bit; y : out integer);
end entity ent_decl_misc;
architecture bh of ent_decl_misc is
  use std.standard.all;
  function f_add(x, y : integer) return integer is
  begin return x + y; end function;
  impure function f_tick return integer is
    variable v : integer := 0;
  begin v := v + 1; return v; end function;
  procedure p_report(val : in integer) is
  begin report "val=" & integer'image(val) severity note; end procedure;
  component adder is
    port(x1, x2 : in integer; z : out integer);
  end component;
  function resolve_bit(v:bit_vector) return bit is
  begin return v(v'left); end function;
  subtype r_bit is resolve_bit bit;
  signal s_bus : r_bit register;
  disconnect s_bus : r_bit after 2 ns;
  attribute style : string;
  attribute style of f_add [integer, integer return integer] : function is "combinational";
  signal s_result : integer := 0;
begin
  process(a, b, op)
  begin
    if op = '1' then s_result <= f_add(a, b); else s_result <= a - b; end if;
    p_report(s_result);
  end process;
  y <= s_result;
end architecture bh;
