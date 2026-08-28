-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Positive
-- Test Focus: Single entity_declarative_item — the entity declarative part contains only one type declaration (type t_depth is range 0 to 511), verifying one repetition of { entity_declarative_item } (exactly one declaration item) is legal in the entity declarative part, an entity may have a single type declaration as the sole declarative part content
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edp_one_ent is
  port(addr:in integer; valid:out bit);
  type t_depth is range 0 to 511;
end entity edp_one_ent;
architecture bh of edp_one_ent is
  signal s_depth:t_depth:=0;
begin
  s_depth<=t_depth(addr mod 512);
  valid<='1' when s_depth<256 else '0';
end architecture bh;
