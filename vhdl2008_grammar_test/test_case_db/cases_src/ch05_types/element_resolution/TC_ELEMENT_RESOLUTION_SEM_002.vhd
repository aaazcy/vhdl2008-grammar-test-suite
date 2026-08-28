-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Positive
-- Test Focus: Semantic: record_resolution for a multi-source
--            error flag register. Each error source drives
--            a resolved record field, and the final record
--            represents the OR of all sources.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity error_flag_aggregator is
  port (
    src0_parity_err  : in  bit;
    src0_timeout_err : in  bit;
    src1_parity_err  : in  bit;
    src1_timeout_err : in  bit;
    parity_err_out   : out bit;
    timeout_err_out  : out bit
  );
end entity error_flag_aggregator;

architecture rtl of error_flag_aggregator is
  function flag_resolve (vs : bit_vector) return bit is
    variable r : bit := '0';
  begin
    for i in vs'range loop r := r or vs(i); end loop;
    return r;
  end function;
  subtype rflag is flag_resolve bit;
  type err_flags is record
    parity  : rflag;
    timeout : rflag;
  end record;
  signal flags : err_flags;
begin
  flags.parity  <= src0_parity_err;
  flags.parity  <= src1_parity_err;
  flags.timeout <= src0_timeout_err;
  flags.timeout <= src1_timeout_err;
  parity_err_out  <= flags.parity;
  timeout_err_out <= flags.timeout;
end architecture rtl;
