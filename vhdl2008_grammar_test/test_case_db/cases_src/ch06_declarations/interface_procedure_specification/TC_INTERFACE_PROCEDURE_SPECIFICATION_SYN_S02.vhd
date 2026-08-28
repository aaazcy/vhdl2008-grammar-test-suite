-- =============================================================
-- Case ID: TC_INTERFACE_PROCEDURE_SPECIFICATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_procedure_specification ::= procedure designator [ [ parameter ] ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: Production-specific: interface_procedure_specification with parameter keyword and formal_parameter_list.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_proc_spec_syn_s2 is
  generic (
    procedure add_values parameter (
      signal x : in  integer;
      signal y : in  integer;
      signal z : out integer
    )
  );
  port (
    clk    : in  bit;
    a, b   : in  integer range 0 to 15;
    result : out integer range 0 to 30
  );
end entity interface_proc_spec_syn_s2;

architecture rtl of interface_proc_spec_syn_s2 is
  signal s_result : integer range 0 to 30 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      add_values(a, b, s_result);
    end if;
  end process;
  result <= s_result;
end architecture rtl;
