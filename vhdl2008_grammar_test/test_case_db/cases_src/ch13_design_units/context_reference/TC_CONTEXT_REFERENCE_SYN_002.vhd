-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SYN_002
-- Rule Type: Syntax
-- BNF Production: context_reference
-- IEEE Section: 13.2
-- BNF Text: context_reference ::= context selected_name { , selected_name } ;
-- Test Focus: context_reference with multiple selected_names in comma list
-- Case Type: Positive
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context type_context is
end context type_context;

context ops_context is
end context ops_context;

context util_context is
end context util_context;

library ieee;
use ieee.std_logic_1164.all;
context work.type_context, work.ops_context, work.util_context;

entity tc_context_reference_syn_002 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity tc_context_reference_syn_002;

architecture rtl of tc_context_reference_syn_002 is
begin
  y <= a;
end architecture rtl;
