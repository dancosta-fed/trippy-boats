import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {});
}

export { initFlatpickr };

// Below is for the flat Range picker. 

// import flatpickr from "flatpickr";
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// const initFlatpickr = () => {
//   flatpickr("#range_start", {
//     altInput: true,
//     plugins: [new rangePlugin({ input: "#range_end"})]
//   });
// }

// export { initFlatpickr };