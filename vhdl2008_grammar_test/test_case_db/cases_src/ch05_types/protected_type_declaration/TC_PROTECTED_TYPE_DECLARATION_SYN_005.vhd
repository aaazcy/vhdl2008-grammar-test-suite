-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: Declaration with impure functions having multiple
--   parameters and default values. Tests complex subprogram
--   declarations in the declarative part.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_complex_params is
  port (
    wr     : in  bit;
    result : out real
  );
end entity pt_decl_complex_params;

architecture rtl of pt_decl_complex_params is
  type t_dsp is protected
    procedure config(gain : real := 1.0; offset : real := 0.0);
    impure function process_sample(input_val : real) return real;
  end protected;
  type t_dsp is protected body
    variable v_gain   : real := 1.0;
    variable v_offset : real := 0.0;
    procedure config(gain : real := 1.0; offset : real := 0.0) is
    begin
      v_gain := gain; v_offset := offset;
    end procedure;
    impure function process_sample(input_val : real) return real is
    begin
      return input_val * v_gain + v_offset;
    end function;
  end protected body;
  shared variable sv : t_dsp;
begin
  process(wr)
  begin
    if wr'event and wr = '1' then
      sv.config(gain => 2.5, offset => 1.0);
      result <= sv.process_sample(10.0);
    end if;
  end process;
end architecture rtl;
