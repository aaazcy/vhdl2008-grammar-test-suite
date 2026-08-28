-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Empty declarative part - zero block_declarative_items: architecture goes directly to begin followed by statements, verifying { } meaning zero repetitions is legal, the most common architecture form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adp_empty_ent is port(a:in bit; y:out bit); end entity;
architecture bh of adp_empty_ent is
begin
  y<=a;
end architecture bh;
