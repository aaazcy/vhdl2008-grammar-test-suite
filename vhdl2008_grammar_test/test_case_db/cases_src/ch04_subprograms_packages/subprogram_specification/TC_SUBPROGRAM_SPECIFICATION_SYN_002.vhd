-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: subprogram_specification: procedure_specification alternative with full parameter list — exercises the 'procedure_specification' branch of the BNF alternative, with a complete formal_parameter_list using multiple signal parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_spec_procedure is
  port (
    req      : in  bit;
    ack      : out bit;
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity;

architecture test of subprog_spec_procedure is
  -- subprogram_specification ::= procedure_specification
  -- Here: procedure designator ( formal_parameter_list )
  procedure p_transfer(
    signal req     : in  bit;
    signal ack     : out bit;
    signal d_in    : in  bit_vector;
    signal d_out   : out bit_vector
  ) is
  begin
    if req = '1' then
      d_out <= d_in;
      ack   <= '1';
    else
      ack <= '0';
    end if;
  end procedure;

  signal s_ack  : bit := '0';
  signal s_data : bit_vector(7 downto 0);
begin
  p_transfer(req, s_ack, data_in, s_data);
  ack      <= s_ack;
  data_out <= s_data;
end architecture test;
