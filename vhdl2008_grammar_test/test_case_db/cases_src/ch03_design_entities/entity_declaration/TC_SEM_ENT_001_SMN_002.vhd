-- =============================================================
-- Case ID: TC_SEM_ENT_001_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ENT_001
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: entity names must be unique within the same design library — same-name entities differing only in case are treated as duplicates under VHDL case-insensitive rules
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Negative example 2: 2 entities named "ENT_CASE" and "ent_case", case-insensitive VHDL analysis should treat them as the same identifier, verifying the analyzer performs case-normalized comparison on entity_simple_name
-- Expected Result: Triggers semantic error: entity name not unique (case-insensitive collision)
-- Dependencies: None
-- =============================================================
entity ENT_CASE is
  port(x : in bit; y : out bit);
end entity ENT_CASE;
architecture bh of ENT_CASE is
begin y <= x; end architecture bh;

entity ent_case is
  port(a : in bit; b : out bit);
end entity ent_case;
