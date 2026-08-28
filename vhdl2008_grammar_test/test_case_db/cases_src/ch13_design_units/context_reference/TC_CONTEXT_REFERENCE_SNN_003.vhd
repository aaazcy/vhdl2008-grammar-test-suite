-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SNN_003
-- Rule Type: Syntax
-- BNF Production: context_reference
-- IEEE Section: 13.2
-- BNF Text: context_reference ::= context selected_name { , selected_name } ;
-- Test Focus: context_reference with dangling comma before the semicolon
-- Case Type: Negative
-- Expected Result: Triggers syntax error: trailing comma before semicolon
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
context work.ctx_a, ;  -- ERROR: dangling comma before ';'

entity tc_context_reference_snn_003 is
  port (
    a : in  std_logic;
    y : out std_logic
  );
end entity tc_context_reference_snn_003;

architecture rtl of tc_context_reference_snn_003 is
begin
  y <= a;
end architecture rtl;
