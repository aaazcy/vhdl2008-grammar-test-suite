-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONTEXT_REF_CIRCULAR
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Negative
-- Rule Description: context_reference must not reference the context currently being defined, which causes circular dependency
-- Error Category: circular dependency error - self reference
-- Test Focus: context_reference self reference: using context_reference inside the design unit to reference its own context name — verifying the tool detects the circular dependency of the context reference
-- Expected Result: Triggers semantic error: circular context reference or self-reference
-- Dependencies: None
-- =============================================================
library ieee;
context work.self_ref_ctx;

entity cr_circular is
  port (
    a : in  bit_vector(3 downto 0);
    y : out bit_vector(3 downto 0)
  );
end entity cr_circular;

architecture rtl of cr_circular is
begin
  y <= a;
end architecture rtl;
