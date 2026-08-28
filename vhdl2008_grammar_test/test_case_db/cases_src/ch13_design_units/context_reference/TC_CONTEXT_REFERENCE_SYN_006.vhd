-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_REFERENCE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: library-qualified selected_name path: context work.type_ctx; — the selected_name uses a library-qualified dot-separated path (library.context_name), verifying the library-qualified identifier path is parsed correctly in context_reference
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context type_ctx is
end context type_ctx;

library ieee;
use ieee.std_logic_1164.all;
context work.type_ctx;

entity cr_dotted_path is
  port (
    sig_in  : in  std_ulogic;
    sig_out : out std_ulogic
  );
end entity cr_dotted_path;

architecture rtl of cr_dotted_path is
begin
  sig_out <= not sig_in;
end architecture rtl;
