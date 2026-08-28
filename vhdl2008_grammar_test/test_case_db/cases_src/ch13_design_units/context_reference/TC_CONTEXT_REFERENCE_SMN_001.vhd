-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONTEXT_REF_NONEXISTENT
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Negative
-- Rule Description: selected_names in a context_reference must actually exist; referencing a nonexistent context name causes a semantic error
-- Error Category: name resolution error - referenced context declaration does not exist
-- Test Focus: referencing a nonexistent context name: context work.nonexistent_context; — the selected_name points to a context that was never declared, verifying semantic analysis detects the failed context name resolution
-- Expected Result: Triggers semantic error: context "nonexistent_context" not found in library "work"
-- Dependencies: None
-- =============================================================
library ieee;
context work.nonexistent_context;

entity cr_bad_name is
  port (
    y : out bit
  );
end entity cr_bad_name;

architecture rtl of cr_bad_name is
begin
  y <= '0';
end architecture rtl;
