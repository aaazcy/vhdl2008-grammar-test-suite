-- =============================================================
-- Case ID: TC_MODE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in ｜ out ｜ inout ｜ buffer ｜ linkage
-- Case Type: Negative
-- Test Focus: SNN: misspelled mode keyword in the mode slot - in 'data : inoutt bit' the "inoutt" is not a legal mode keyword (in / out / inout / buffer / linkage), being treated as an undeclared type name causing the parse to fail
-- Expected Result: Triggers syntax error: no declaration for "inoutt"
-- Dependencies: None
-- =============================================================
entity mode8a_ent is
  port (
    clk : in  bit;
    data : inoutt bit
  );
end entity mode8a_ent;
