-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_clause ::= { context_item }
-- Case Type: Positive
-- Test Focus: complete context_clause mixing three item kinds: library ieee; use ieee.std_logic_1164.all; context work.my_ctx; — verifying context_clause contains a combination of three different context_items: library_clause, use_clause, context_reference
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
context ctx_mixer is
  library ieee;
  use ieee.std_logic_1164.all;
end context ctx_mixer;

library ieee;
use ieee.std_logic_1164.all;
context work.ctx_mixer;

entity cc_full_mix is
  port (
    sig_in  : in  std_ulogic;
    sig_out : out std_ulogic
  );
end entity cc_full_mix;

architecture rtl of cc_full_mix is
begin
  sig_out <= sig_in;
end architecture rtl;
