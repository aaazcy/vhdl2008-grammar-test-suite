-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_REFERENCE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: long comma list of multiple selected_names: context work.ctx1, work.ctx2, work.ctx3, work.ctx4, work.ctx5; — verifying { , selected_name } repeated 4 times and the whole long list parsed correctly
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context math_ctx is
end context math_ctx;

context type_ctx is
end context type_ctx;

context ops_ctx is
end context ops_ctx;

context io_ctx is
end context io_ctx;

context util_ctx is
end context util_ctx;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
context work.math_ctx, work.type_ctx, work.ops_ctx, work.io_ctx, work.util_ctx;

entity cr_many_names is
  port (
    a : in  unsigned(3 downto 0);
    b : in  unsigned(3 downto 0);
    y : out unsigned(3 downto 0)
  );
end entity cr_many_names;

architecture rtl of cr_many_names is
begin
  y <= a + b;
end architecture rtl;
