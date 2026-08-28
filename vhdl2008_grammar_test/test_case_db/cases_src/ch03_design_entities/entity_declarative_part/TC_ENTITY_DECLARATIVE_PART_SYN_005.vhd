-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Positive
-- Test Focus: Three entity_declarative_items (type+signal+attribute_spec) — the entity declarative part contains type t_level, signal s_level and attribute_specification, verifying three declaration items of different types form a complete declaration context in the entity declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edp_three_ent is
  port(clk:in bit; level:out integer);
  type t_level is range 0 to 15;
  signal s_level:t_level:=0;
  attribute desc:string;
  attribute desc of s_level:signal is "priority_level";
end entity edp_three_ent;
architecture bh of edp_three_ent is
begin
  process(clk) begin
    if clk'event and clk='1' then
      if s_level<15 then s_level<=s_level+1; else s_level<=0; end if;
    end if;
  end process;
  level<=integer(s_level);
end architecture bh;
