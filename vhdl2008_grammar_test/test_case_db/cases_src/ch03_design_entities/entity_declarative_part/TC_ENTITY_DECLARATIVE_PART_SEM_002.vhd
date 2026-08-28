-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_EDP_002
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: declarations of entity_declarative_part are visible in entity_statement_part — passive statements can reference types and constants in the entity declarative part
-- Case Type: Positive
-- Error Category: scope_visibility
-- Test Focus: Positive example: the entity declarative part defines type t_thresh range 0 to 100 and constant C_LIMIT:t_thresh:=80, entity_statement_part contains a concurrent_assertion using C_LIMIT to check whether the input port value exceeds the limit, verifying names of the entity declarative part are legally visible in passive statements of the entity statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edp_sem2_ent is
  port(clk:in bit; sensor:in integer);
  type t_thresh is range 0 to 100;
  constant C_LIMIT:t_thresh:=80;
begin
  assert sensor<integer(C_LIMIT)
    report "sensor value exceeds limit" severity warning;
end entity edp_sem2_ent;
architecture bh of edp_sem2_ent is
begin end architecture bh;
