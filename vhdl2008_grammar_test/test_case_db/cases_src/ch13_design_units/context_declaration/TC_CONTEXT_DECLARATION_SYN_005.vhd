-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Positive
-- Test Focus: end context followed by context_simple_name: end context ctx_myname; — verifying a repeated context simple name may follow end context as the closing identifier
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
context ctx_named_end is
  library ieee;
  use ieee.std_logic_1164.all;
end context ctx_named_end;

library ieee;
use ieee.std_logic_1164.all;

entity cd_full_end_ent is
  port(
    sig_in  : in  std_ulogic;
    sig_out : out std_ulogic
  );
end entity cd_full_end_ent;

architecture rtl of cd_full_end_ent is
begin
  sig_out <= sig_in;
end architecture rtl;
