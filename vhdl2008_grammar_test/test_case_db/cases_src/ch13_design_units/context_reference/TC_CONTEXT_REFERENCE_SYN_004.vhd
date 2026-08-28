-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_REFERENCE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: comma list of two selected_names: context work.pkg_a_ctx, work.pkg_b_ctx; — verifying context_reference contains two comma-separated selected_names, with { , selected_name } repeated once
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context type_ctx is
end context type_ctx;

context ops_ctx is
end context ops_ctx;

library ieee;
use ieee.std_logic_1164.all;
context work.type_ctx, work.ops_ctx;

entity cr_two_names is
  port (
    din  : in  std_logic_vector(1 downto 0);
    dout : out std_ulogic
  );
end entity cr_two_names;

architecture rtl of cr_two_names is
begin
  dout <= din(0) and din(1);
end architecture rtl;
