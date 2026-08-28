-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SNN_002
-- Rule Type: Syntax
-- BNF Production: context_reference
-- IEEE Section: 13.2
-- BNF Text: context_reference ::= context selected_name { , selected_name } ;
-- Test Focus: context_reference missing the 'context' keyword — only selected_name present
-- Case Type: Negative
-- Expected Result: Triggers syntax error: missing 'context' keyword before selected_name
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
work.common_pkg_context;  -- ERROR: missing 'context' keyword

entity tc_context_reference_snn_002 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity tc_context_reference_snn_002;

architecture rtl of tc_context_reference_snn_002 is
begin
  y <= a;
end architecture rtl;
