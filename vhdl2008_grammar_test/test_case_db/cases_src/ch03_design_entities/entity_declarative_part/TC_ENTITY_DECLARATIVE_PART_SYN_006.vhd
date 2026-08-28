-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Positive
-- Test Focus: Mixed 5 different entity_declarative_items — the entity declarative part contains type(t_color enumeration), subtype(t_primary), constant(C_NUM=4), signal(s_sel), alias(a_clk->clk), verifying 5 repetitions of { } with each item of a distinct kind are legal in the entity declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edp_mixed_ent is
  port(clk:in bit; sel:in integer; result:out bit);
  type t_color is (red,green,blue,yellow);
  subtype t_primary is t_color range red to blue;
  constant C_NUM:integer:=4;
  signal s_sel:t_primary:=red;
  alias a_clk is clk;
end entity edp_mixed_ent;
architecture bh of edp_mixed_ent is
begin
  process(a_clk) begin
    if a_clk'event and a_clk='1' then
      s_sel<=t_primary'val(sel mod C_NUM);
    end if;
  end process;
  result<='1' when s_sel=red else '0';
end architecture bh;
