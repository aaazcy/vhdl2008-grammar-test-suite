-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Negative
-- Test Focus: package_declarative_part: duplicate signal name — the { } repetition allows multiple items but each identifier must be unique in the declarative region; signal declared twice with same name is an error
-- Expected Result: Triggers semantic error: duplicate signal declaration
-- Dependencies: None
-- =============================================================
entity pdp_duplicate_signal is
  port (
    ch_a, ch_b : out bit
  );
end entity;

architecture test of pdp_duplicate_signal is
  signal s_shared : bit := '0';
  -- ERROR: duplicate signal with same name s_shared
  -- BNF { package_declarative_item } allows multiple signal_declarations
  -- but each identifier must be unique
  signal s_shared : bit := '1';  -- duplicate
begin
  ch_a <= s_shared;
  ch_b <= s_shared;
end architecture test;
