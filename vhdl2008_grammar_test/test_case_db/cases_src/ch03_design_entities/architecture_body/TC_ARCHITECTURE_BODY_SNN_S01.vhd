-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SNN_S01
-- Rule Type: Syntax
-- BNF Production: ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Test Focus: architecture_body: missing "of" keyword
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
architecture bad_arch is some_entity  -- ERROR: missing "of"
  signal s:bit; begin s<=not s; end architecture;
