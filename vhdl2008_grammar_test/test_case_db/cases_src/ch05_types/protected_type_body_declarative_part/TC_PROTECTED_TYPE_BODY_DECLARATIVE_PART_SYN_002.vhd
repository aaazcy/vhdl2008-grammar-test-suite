-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::=
--   { protected_type_body_declarative_item }
-- Test Focus: Single item — one variable declaration in the
--   body declarative part. The minimal non-empty case.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_dp_single_item is
  port (
    clk : in  bit;
    cnt : out natural
  );
end entity pt_body_dp_single_item;

architecture rtl of pt_body_dp_single_item is
  type t_mono is protected
    procedure bump;
    impure function value return natural;
  end protected;
  type t_mono is protected body
    variable v_n : natural := 0;
    procedure bump is begin v_n := v_n + 1; end procedure;
    impure function value return natural is begin return v_n; end function;
  end protected body;
  shared variable sv : t_mono;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.bump;
      cnt <= sv.value;
    end if;
  end process;
end architecture rtl;
