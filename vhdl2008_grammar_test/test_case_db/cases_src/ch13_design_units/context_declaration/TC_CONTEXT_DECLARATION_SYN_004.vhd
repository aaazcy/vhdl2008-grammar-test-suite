-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Positive
-- Test Focus: end followed by the context keyword: end context; — verifying the context keyword may be optionally added after end, conforming to VHDL 2008 syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
context ctx_end_ctx is
  library ieee;
  use ieee.std_logic_1164.all;
end context;

library ieee;
use ieee.std_logic_1164.all;

entity cd_end_ctx_ent is
  port(
    d : in  std_ulogic;
    q : out std_ulogic
  );
end entity cd_end_ctx_ent;

architecture rtl of cd_end_ctx_ent is
begin
  q <= d;
end architecture rtl;
