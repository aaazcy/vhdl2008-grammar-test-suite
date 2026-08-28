-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific direct element_subtype_definition.
--            Multiple subtype_indicators define constrained element
--            types for a PID controller's coefficient and error
--            storage arrays.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pid_controller_storage is
  port (
    clk    : in  bit;
    kp     : in  integer range 0 to 255;
    ki     : in  integer range 0 to 255;
    kd     : in  integer range 0 to 255;
    err    : in  integer range -128 to 127;
    ctrl   : out integer range -32768 to 32767
  );
end entity pid_controller_storage;

architecture rtl of pid_controller_storage is
  -- element_subtype_definition: various subtype_indications
  subtype coeff_t is integer range 0 to 255;
  subtype error_t is integer range -128 to 127;
  subtype output_t is integer range -32768 to 32767;
  type coeff_set is record
    p : coeff_t;
    i : coeff_t;
    d : coeff_t;
  end record;
  type error_history is array (0 to 2) of error_t;
  signal gains  : coeff_set;
  signal errors : error_history := (others => 0);
  signal acc    : output_t := 0;
begin
  process(clk)
    variable v_pid : output_t;
  begin
    if clk'event and clk = '1' then
      gains.p <= kp;
      gains.i <= ki;
      gains.d <= kd;
      errors(0) <= err;
      errors(1) <= errors(0);
      errors(2) <= errors(1);
      v_pid := gains.p * errors(0)
             + gains.i * (errors(0) + errors(1) + errors(2))
             + gains.d * (errors(0) - errors(1));
      ctrl <= v_pid;
    end if;
  end process;
end architecture rtl;
