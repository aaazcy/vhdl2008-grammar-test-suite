-- =============================================================
-- Case ID: TC_CONTEXT_REFERENCE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONTEXT_REF_VALID
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_reference ::= context selected_name { , selected_name } ;
-- Case Type: Positive
-- Rule Description: the context_declaration referenced by context_reference must be visible in the current design library, and each of multiple selected_names must resolve correctly
-- Test Focus: libraries/packages declared earlier by library/use can be used by context_reference: library ieee; use ieee.std_logic_1164.all; context work.tools_ctx, work.types_ctx; — each selected_name in context_reference refers to a context_declaration in the work library, verifying reference visibility semantics
-- Expected Result: Compiles successfully (context declarations must exist in work library)
-- Dependencies: None
-- =============================================================
context tools_ctx is
  library ieee;
  use ieee.std_logic_1164.all;
end context tools_ctx;

context types_ctx is
  library ieee;
  use ieee.numeric_std.all;
end context types_ctx;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
context work.tools_ctx, work.types_ctx;

entity cr_sem_valid is
  port (
    clk   : in  std_ulogic;
    din   : in  std_logic_vector(7 downto 0);
    dout  : out std_logic_vector(7 downto 0)
  );
end entity cr_sem_valid;

architecture rtl of cr_sem_valid is
  signal s_data : unsigned(7 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      s_data <= unsigned(din) + 1;
    end if;
  end process;
  dout <= std_logic_vector(s_data);
end architecture rtl;
