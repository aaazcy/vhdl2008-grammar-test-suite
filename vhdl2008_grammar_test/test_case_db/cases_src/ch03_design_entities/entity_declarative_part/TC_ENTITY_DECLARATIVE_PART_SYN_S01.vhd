-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Test Focus: Entity declarative part: zero or more entity_declarative_items as declarative region
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_entity_declarative_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_entity_declarative_part_syn_s01 is
  type t_edp is range 0 to 31; subtype t_edp_s is t_edp range 0 to 15;
  constant C_MIN:t_edp:=0; constant C_MAX:t_edp:=31; signal s_edp:t_edp:=C_MIN;
  component comp_edp is port(x:in t_edp;y:out t_edp); end component;
begin
  s_edp<=C_MAX; r<=integer(s_edp);end architecture bh;
