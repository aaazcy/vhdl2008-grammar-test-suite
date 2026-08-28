-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Test Focus: context_declaration: missing "is" in context unit
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
context bad_ctx  -- ERROR: missing "is"
  library work;
end context;
