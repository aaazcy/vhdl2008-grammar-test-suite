-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: Duplicate identifier - two signals in the declarative part are both named s_dup, an identifier conflict within the same declarative region, verifying the analyzer checks identifier uniqueness among block_declarative_items
-- Expected Result: Triggers syntax/semantic error: duplicate identifier in declarative part
-- Dependencies: None
-- =============================================================
entity adp_snn1_ent is port(a:in bit; y:out bit); end entity;
architecture bh of adp_snn1_ent is
  signal s_dup:bit:='0';
  signal s_ok:bit:='0';
  signal s_dup:bit:='1';
begin y<=s_ok; end architecture bh;
